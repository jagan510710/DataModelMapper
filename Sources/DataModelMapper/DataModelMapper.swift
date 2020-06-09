import  Foundation
public struct EmployeeDetails:Codable
{
    var name:String?
    var email:String?
}
public class UserDetails:Codable
{
   
    var name:String?
    var email:String?
}
public struct EmployeeDetails:Codable
{
    public struct DataObj:Codable{
        var id:String?
        var employee_name:String?
        var employee_salary:String?
        var employee_age:String?
    }
    var status:String?
    var data:DataObj?
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


