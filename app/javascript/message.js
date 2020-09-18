// $(function () {
//   // function buildHTML(message) {
//   // 画像+自分
//   //   if (message.image && message.user.id == current_user.id) {
//   //     let html =
//   //     `<div class="message1">
//   //       <div class="message1__left">
//   //         <div class="time">
//   //           ${message.updated_at.strftime("%Y-%m-%d %H:%M")}
//   //         </div>
//   //       </div>
//   //       <div class="message1__right">
//   //         <div class="Speech-bubble">
//   //           <div class="mycomment">
//   //           ${(simple_format, message.content)}
//   //           </div>
//   //           <img class="Message__image" src="${message.image.url}">
//   //         </div>
//   //       </div>
//   //     </div>`
//   //     return html;
//   //     // gazoud相手
//   //   } elsif (message.image && message.user.id != current_user.id) {
//   //     let html =
//   //     `<div class="message ">
//   //       <div class="message__left">
//   //         <img class="imgsize2" src="${message.user.profile_image}">
//   //       </div>
//   //       <div class="message__right">
//   //         <div class="message__right__username">
//   //           ${message.user.username}
//   //         </div>
//   //         <div class="message__right__date">
//   //           <div class="Speech-bubble">
//   //             <div class="says">
//   //               ${(simple_format, message.content)}
//   //             </div>
//   //             <img class="Message__image" src="${message.image.url}">
//   //           </div>
//   //           <div class="time">
//   //             ${message.updated_at.strftime("%Y-%m-%d %H:%M")}
//   //           </div>
//   //         </div>
//   //       </div>
//   //     </div>`
//   //     return html;
//   //   } else {
//   //     let html = `<div class="MessageBox">
//   //       <div class="MessageInfo">
//   //         <div class="MessageInfo__userName">
//   //           ${message.user_name}
//   //         </div>
//   //         <div class="MessageInfo__date">
//   //           ${message.created_at}
//   //         </div>
//   //       </div>
//   //       <div class="Message">
//   //         <p class="Message__content">
//   //           ${message.content}
//   //         </p>
//   //       </div>
//   //     </div>`;
//   //     return html;
//   //   }
//   // }
//   function buildHTML(message) {
//     if (message.image) {
//       let html = `<div class="message1">
//       <div class="message1__left">
//         <div class="time">
//         ${message.updated_at.strftime("%Y-%m-%d %H:%M")}
//         </div>
//       </div>
//       <div class="message1__right">
//         <div class="Speech-bubble">

//           <div class="mycomment">
//           ${(simple_format, message.content)}

//           </div>
//           <div class="mycomment">
//           ${message.user_name}

//           </div>
//           <img class="Message__image" src="${message.image.url}">
//           <% end %>

//         </div>
//       </div>
//     </div>`;
//       return html;
//     } else {
//       let html = `<div class="message1">
//       <div class="message1__left">
//         <div class="time">
//         ${message.updated_at.strftime("%Y-%m-%d %H:%M")}
//         </div>
//       </div>
//       <div class="message1__right">
//         <div class="Speech-bubble">

//           <div class="mycomment">
//           ${(simple_format, message.content)}

//           </div>
//           <div class="mycomment">
//           ${message.user_name}

//           </div>

//           <% end %>

//         </div>
//       </div>
//     </div>`;
//       return html;
//     }
//   }

//   $(".Form").on("submit", function (e) {
//     // preventDefault()を使用してデフォルトのイベントを止める
//     e.preventDefault();
//     let formData = new FormData(this);
//     let url = $(this).attr("action");
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: "json",
//       processData: false,
//       contentType: false,
//     }).done(function (data) {
//       console.log("h");
//       let html = buildHTML(data);
//       $(".message1").append(html);
//       $(".Form")[0].reset();
//     });
//   });
// });
