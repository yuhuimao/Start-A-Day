# Start-A-Day

## 設計方向
* 可以馬上得知一天的開始所需的資訊
* 開啟APP即可以知道今天的天氣、代辦事項、新聞三項資訊
* 下階段加上「捷運/台鐵時刻表」讓內容更符合一天開始所需的資訊

## 使用技術

### UI
* 使用SwiftUI刻UI
* 使用UIKit + SwiftUI刻部分畫面(如WKWebView、SearchBar)

### 資料存取
* 使用UserDefault來儲存「代辦清單」的資訊
* 使用中央氣象局及NewsAPI的open API來取得天氣及新聞的資訊

### WebView
* 使用WebView開啟新聞頁面

## 操作畫面

### 首頁
<img src="https://github.com/yuhuimao/Start-A-Day/blob/main/Simulator%20Screen%20Shot%20-%20iPhone%2012%20mini%20-%202021-07-16%20at%2016.50.10.png" width="250" height="550" />


### 選擇顯示天氣地區
<img src="https://github.com/yuhuimao/Start-A-Day/blob/main/Simulator%20Screen%20Shot%20-%20iPhone%2012%20mini%20-%202021-07-16%20at%2017.05.09.png" width="250" height="550" /> <img src="https://github.com/yuhuimao/Start-A-Day/blob/main/Simulator%20Screen%20Shot%20-%20iPhone%2012%20mini%20-%202021-07-16%20at%2017.05.26.png" width="250" height="550" />

### 新增及完成待辦事項
<img src="https://github.com/yuhuimao/Start-A-Day/blob/main/Simulator%20Screen%20Shot%20-%20iPhone%2012%20mini%20-%202021-07-16%20at%2017.06.08.png" width="250" height="550" /> <img src="https://github.com/yuhuimao/Start-A-Day/blob/main/Simulator%20Screen%20Shot%20-%20iPhone%2012%20mini%20-%202021-07-16%20at%2017.06.11.png" width="250" height="550" />

### 新聞 WebView
<img src="https://github.com/yuhuimao/Start-A-Day/blob/main/Simulator%20Screen%20Shot%20-%20iPhone%2012%20mini%20-%202021-07-16%20at%2017.06.31.png" width="250" height="550" />
