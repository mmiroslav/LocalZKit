# LocalZKit

### Init 

Set translates as key-value dictionary `[String: String]` and set translates locale:

    LocalZManager.shared.setTranslates(translates: translateDictionary, locale: .en)
    LocalZManager.shared.version = "0.0.1"
    
Change locale in  application:

    LocalZManager.shared.currentLocale = .en


### Usage 

In order to move translates in memory, usualy on app start, or after updating translates:

    LocalZManager.shared.updateTranslates()

In app use `String` extension to get localised string:

    nameLabel.text = "name".localized()
    saveBtn.setTitle("save".localz, for: .normal)
    
Whenever locale is changed notification named `localz.notification.localeChanged` is brotcasted, so all screens, that listening on thins notification, can be updated. 

    NotificationCenter.default.addObserver(self, selector: #selector(updateLocalization), name: LocalZManager.localZNotificationName, object: nil)
    
### Contact

miroslav.p.milivojevic@gmail.com
