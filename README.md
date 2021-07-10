# Start-A-Day

## 設計方向
* 可以馬上得知一天的開始所需的資訊
* 開啟APP即可以知道今天的天氣、代辦事項、新聞三項資訊
* 下階段加上「捷運/台鐵時刻表」讓內容更符合一天開始所需的資訊

## 使用技術

### UI
* 使用SwiftUI刻UI
* 使用UIKit + SwiftUI刻部分畫面(如WKWebView)

### 資料存取
* 使用UserDefault來儲存「代辦清單」的資訊
* 使用中央氣象局及NewsAPI的open API來取得天氣及新聞的資訊

![image](https://github.com/yuhuimao/Start-A-Day/blob/main/startADayDemo.png)
