

import UIKit

class ReminderListViewController: UICollectionViewController {
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData
    var filteredReminders: [Reminder]{
        return reminders.filter{listStyle.shouldInclude(date: $0.dueDate)}.sorted{$0.dueDate <  $1.dueDate}
    }
    var listStyle: ReminderListStyle = .today
    var listStyleSegmentControl = UISegmentedControl(items: [
        ReminderListStyle.today.name, ReminderListStyle.future.name, ReminderListStyle.all.name
    ])
    var headerView: ProgressHeaderView?
    var progress: CGFloat{
        let chunkSize = 1.0/CGFloat(filteredReminders.count)
        let progress = filteredReminders.reduce(0.0) {
                   let chunk = $1.isComplete ? chunkSize : 0
                   return $0 + chunk
               }
        return progress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        let headerRegistration = UICollectionView.SupplementaryRegistration(elementKind: ProgressHeaderView.elementKind, handler: supplementaryRegistrationHandler)
        dataSource.supplementaryViewProvider = { supplementaryView, elementKind, indexPath in
                   return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
               }
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAddButton(_:)))
        addButton.accessibilityLabel = NSLocalizedString("Add reminder ", comment: "Add button acccessibiity Label")
        navigationItem.rightBarButtonItem = addButton
        
        listStyleSegmentControl.selectedSegmentIndex =  listStyle.rawValue
        listStyleSegmentControl.addTarget(self, action: #selector(didChangeListStyle(_:)), for: .valueChanged)
        navigationItem.titleView = listStyleSegmentControl
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        //        let id = reminders[indexPath.item].id
        let  id = filteredReminders[indexPath.item].id
        showDetail(for: id)
        return false
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
         guard elementKind == ProgressHeaderView.elementKind, let progressView = view as? ProgressHeaderView else {
             return
         }
         progressView.progress = progress
     }
    
    func showDetail(for id: Reminder.ID) {
        let reminder = reminder(for: id)
        let viewController = ReminderViewController(reminder: reminder){[weak self] reminder  in
            self?.update(reminder, with: reminder.id)
            self?.updateSnapshot(reloading: [reminder.id])
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.headerMode = .supplementary
        listConfiguration.showsSeparators = false
        listConfiguration.trailingSwipeActionsConfigurationProvider = makeSwipeActions
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    private func makeSwipeActions(for indexPath: IndexPath?)-> UISwipeActionsConfiguration?{
        guard let indexPath = indexPath, let id = dataSource.itemIdentifier(for: indexPath) else {return nil}
        let deleteActionTitle = NSLocalizedString("Delete", comment: "Delete Action Title")
        let deleteAction = UIContextualAction(style: .destructive, title: deleteActionTitle){[weak self] _, _,completion in
            self?.deleteReminder(with: id)
            self?.updateSnapshot()
            completion(false)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    private func  supplementaryRegistrationHandler(processView: ProgressHeaderView,elementKind: String, indexPath: IndexPath){
        headerView = processView
    }
}


