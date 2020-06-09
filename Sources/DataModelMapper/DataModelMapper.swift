import  Foundation

public struct UserDetails:Codable
{
    var name:String?
    var email:String?
}

public class DataModelMapper
{
    public static let shared = DataModelMapper.init()
    public func decodeData<T:Codable>(_ data:Data)->T{
        let decoder = JSONDecoder()
        guard let modelData = try? decoder.decode(T.self, from: data) else
        {
            fatalError("")
            
        }
        return modelData
    }
    public func offlineData<T:Codable>(_ fileName:String)->T
     {
        return Bundle.main.decodeFromBundle(fileName)
     }
    
    
}
extension Bundle
{
    func decodeFromBundle<T:Codable>(_ fileName:String)->T
    {
        guard let url = self.url(forResource: fileName, withExtension: nil)
            else{
                fatalError("")
        }
        guard let data = try? Data(contentsOf: url) else
        {
            fatalError("")
        }
        let decoder = JSONDecoder()
        guard let modelData = try? decoder.decode(T.self, from: data) else
        {
            fatalError("")

        }
        return modelData
    }
}


