# **NetworkInterchangable**

NetworkInterchangable, iOS projelerinde ağ (networking) işlemlerini öğrenmek ve uygulamak için geliştirilmiş bir projedir. Proje, JSONPlaceholder API'si üzerinden kullanıcı verilerini almak ve göstermek için basit ve genişletilebilir bir yapı sunar.

## **Özellikler**
- REST API kullanımı ile kullanıcı verilerinin alınması
- Sabitler (`Constants`) kullanarak merkezi yapılandırma
- Modüler ve genişletilebilir kod yapısı
- JSONPlaceholder API üzerinden sahte veri yönetimi

## **Kullanılan Teknolojiler**
- Swift
- URLSession
- JSON Parsing (Decodable)
- Modüler yapı ve Constants kullanımı

## **Kod Yapısı**

### **Constants.swift**
Proje, ağ isteklerinde kullanılan yollar ve URL’ler için bir `Constants` yapısı içerir:

```swift
struct Constants {
    struct Paths {
        static let baseUrl = "users"
    }
    struct Urls {
        static let baseUrl = "https://jsonplaceholder.typicode.com"
        static let usersExtension = "\(baseUrl)/users"
    }
}
```

Bu yapı, projede kullanılan temel URL ve yollara merkezi bir erişim sağlar.

### **Networking**
Proje, `URLSession` ile ağ isteği yapma ve alınan veriyi işleme adımlarını içerir. Örnek kullanım:

```swift
func fetchUsers(completion: @escaping ([User]?) -> Void) {
    guard let url = URL(string: Constants.Urls.usersExtension) else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            let decoder = JSONDecoder()
            let users = try? decoder.decode([User].self, from: data)
            completion(users)
        } else {
            completion(nil)
        }
    }.resume()
}
```

## **Kurulum**
Bu projeyi kurmak için aşağıdaki adımları izleyin:

1. Bu depoyu klonlayın:
   ```bash
   git clone https://github.com/yourusername/NetworkInterchangable.git
   ```
2. Proje dizinine gidin:
   ```bash
   cd NetworkInterchangable
   ```
3. Projeyi Xcode ile açın:
   ```bash
   open NetworkInterchangable.xcodeproj
   ```
4. Uygulamayı çalıştırın.

## **Kullanım**
1. Uygulamayı çalıştırarak kullanıcı verilerini çekin.
2. Veriler, JSONPlaceholder API'sinden alınarak ekranda görüntülenir.
3. Gerektiğinde `Constants.swift` dosyasını düzenleyerek farklı API uç noktaları için yapılandırma yapabilirsiniz.
