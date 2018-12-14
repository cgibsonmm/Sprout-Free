document.addEventListener("trix-initialize", function(event) {
  var element = $("trix-editor");
  element.on("inserted.atwho", function(event, flag, query) {
      element[0].editor.insertString(flag[0].innerHTML);
  });
});
