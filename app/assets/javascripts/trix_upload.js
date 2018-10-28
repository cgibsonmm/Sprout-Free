// function uploadAttachment(attachment) {
//   var file = attachment.file;
//   var form = new FormData;
//   form.append("Content-Type", file.type);
//   form.append("forum_post_photos[image]", file);
//
//   var xhr = new XMLHttpRequest;
//   xhr.open("POST", "/forum_post_photos.json", true);
//   xhr.setRequestHeader("X-CSRF-Token", Rails.csrfToken());
//
//   xhr.upload.onprogress = function(event){
//     var progress = event.loaded / event.total * 100;
//     attachment.setUploadProgress(progress);
//   }
//
//   xhr.onload = function(){
//     if (xhr.status == 201){
//       var data = JSON.parse(xhr.responseText);
//       return attachment.setAttributes({
//         url: data.image_url,
//         href: data.image_url
//       })
//     }
//   }
//
//   return xhr.send(form);
// }
//
// document.addEventListener("trix-attachment-add", function(event){
//   var attachment = event.attachment;
//
//   if (attachment.file){
//     console.log('new',attachment);
//     return uploadAttachment(attachment);
//   }
// });


// //// NEW JS
// Turn off the default Trix captions
// Trix.config.attachments.preview.caption = {
//   name: false,
//   size: false
// };
//
// function uploadAttachment(attachment) {
//   var options = {
//     extension: attachment.file.name.match(/(\.\w+)?$/)[0],                        //Set the file extension
//     _: Date.now()                                                                 //Prevent Caching
//   };
//   $.getJSON("/", options, function(result) {
//     // Create our form data to submit
//     var file = attachment.file;
//     var form = new FormData;
//     form.append("key", result['fields']['key']);
//     form.append("policy", result['fields']['policy']);
//     form.append("x-amz-credential", result['fields']['x-amz-credential']);
//     form.append("x-amz-algorithm", result['fields']['x-amz-algorithm']);
//     form.append("x-amz-date", result['fields']['x-amz-date']);
//     form.append("x-amz-signature", result['fields']['x-amz-signature']);
//     form.append("file", file);
//     // Create our XHR request
//     var xhr = new XMLHttpRequest;
//     xhr.open("POST", result['url'], true);
//
//     // Report file uploads back to Trix
//     xhr.upload.onprogress = function (event) {
//       var progress = event.loaded / event.total * 100;
//       attachment.setUploadProgress(progress);
//     }
//
//     // Tell Trix what url and href to use on successful upload
//     xhr.onload = function () {
//       if (xhr.status === 204) {
//         var image = {
//           id: result['fields']['key'].match(/cache\/(.+)/)[1],
//           storage: "cache",
//           metadata: {
//             size: attachment.filesize,
//             filename: attachment.filename,
//             mime_type: attachment.contentType
//           }
//         };
//         rails_form = new FormData;
//         rails_form.append("photo[image]", JSON.stringify(image));
//         $.ajax("/photos", {
//           contentType: false,
//           processData: false,
//           data: rails_form,
//           method: 'POST',
//           dataType: 'json'
//         }).done(function(data){
//           return attachment.setAttributes({
//             url: data.image_url,
//             href: data.url
//           })
//         });
//       }
//     }
//     return xhr.send(form);
//   });
// }
//
// // Listen for the Trix attachment event to trigger upload
// document.addEventListener("trix-attachment-add", function(event) {
//   var attachment = event.attachment;
//   if (attachment.file) {
//     return uploadAttachment(attachment);
//   }
// });
