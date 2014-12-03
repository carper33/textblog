//= require marked.min
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
  postBody.keydown(throttle(function() {
    var processedBody = marked(postBody.val());
    renderedPostBody.html(processedBody);
    postBody.height(renderedPostBody.height());
  }, 200));





  var imageEditor = $("#image_editor_footer");
  imageEditor.click(function() {
    imageEditor.toggleClass("active");
  });
});
