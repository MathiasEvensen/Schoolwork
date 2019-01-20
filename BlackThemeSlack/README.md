# Black Theme Slack

* Make sure to use code from your own repository to mitigate the risk of XSS attacks
* APPEND TO END OF FILE C:\Users\mathi\AppData\Local\slack\app-3.3.3\resources\app.asar.unpacked\src\static/ssb-interop.js

```
document.addEventListener('DOMContentLoaded', function() {
 $.ajax({
   url: 'https://raw.githubusercontent.com/laCour/slack-night-mode/master/css/raw/black.css',
   success: function(css) {
     $("<style></style>").appendTo('head').html(css);
   }
 });
});
```