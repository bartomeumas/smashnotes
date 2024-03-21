import CoreData

class PersistenceController {
  static let shared = PersistenceController()

  private let container: NSPersistentContainer

  init() {
    container = NSPersistentContainer(name: "CoreModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
  }
  
  public var viewContext: NSManagedObjectContext {
    return container.viewContext
  }
    
    
}

extension PersistenceController {
    public func saveNotes() {
      let context = PersistenceController.shared.container.viewContext
      
      do {
        try context.save()
      } catch {
        print("Failed to save notes: \(error)")
      }
    }
    public func loadNotes() -> [Note] {
      let context = PersistenceController.shared.container.viewContext
      let request: NSFetchRequest<Note> = Note.fetchRequest()
      
      do {
        let notes = try context.fetch(request)
        return notes
      } catch {
        print("Failed to fetch notes: \(error)")
        return []
      }
    }

}
