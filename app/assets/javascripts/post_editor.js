//= require marked.min
//= require jquery.uploadfile
//
window.throttle = function(cb, time) {
  var timer;

  return function() {
    timer && clearTimeout(timer);
    setTimeout(cb, time)
  }
};

$(document).ready(function() {
  var postBody = $("#post_body");
  var renderedPostBody = $("#rendered_post_body");

  var refresh = throttle(function() {
    var processedBody = marked(postBody.val());
    renderedPostBody.html(processedBody);
    postBody.height(renderedPostBody.height());
  }, 200)

  postBody.keydown(refresh);


  var imageEditor = $("#image_editor_footer");
  imageEditor.click(function() {
    imageEditor.toggleClass("active");
  });

  $("#picture-upload-button").uploadFile({
    url:"/pictures",
    fileName:"picture",
    dragDrop: false,
    onSuccess:function(files,data,xhr) {
      $("#all-pictures").append(data);
    },
    showStatusAfterSuccess:false
  });

  $(document).on("click", "#all-pictures img", function() {
    var imageUrl = this.src;
    var valueToInsert = "![](" + imageUrl + ")";
    var currentPosition = postBody.prop('selectionStart');
    var currentValue = postBody.val();
    var newValue = currentValue.substring(0, currentPosition) + valueToInsert + currentValue.substring(currentPosition)
    postBody.val(newValue);
    refresh();
  });

  refresh();
});
