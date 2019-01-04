var os = require('os');

exports.prints = function(){
  return 'OS: ' + os.type() +
  '<br>Version: ' + os.release() +
  '<br>Platform: ' + os.platform();
}

exports.tid = function () {
  return Date();
};
