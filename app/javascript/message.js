$(function () {
  function buildHTML(message) {
    // var content = message.content ? `${message.content}` : "";
    // var img = message.image ? `<img src= ${message.image}>` : "";
    // var userimg = message.userimg;
    var userid = message.user_id;
    var current = message.currentuser_id;
    if (message.image && userid == current) {
      let html = `<div class="message1">
        <div class="message1__left">
          <div class="time">
          ${message.created_at}
          </div>
        </div>
        <div class="message1__right">
          <div class="Speech-bubble">
            <div class="mycomment">
            <p>${message.content}</p>
            </div>
            <img class="Message__image" src="${message.image}">
          </div>
        </div>
      </div>`;
      return html;
      // } elsif (message.image && userid != current) {
      //   let html = `<div class="message">
      //   <div class="message__left">
      //     ${userimg}
      //   </div>
      //   <div class="message__right">
      //     <div class="message__right__username">
      //       ${message.user_name}
      //     </div>
      //     <div class="message__right__date">
      //       <div class="Speech-bubble">
      //         <div class="says">
      //           <p>${message.content}</p>
      //         </div>
      //         <img class="Message__image" src="${message.img}">
      //       </div>
      //       <div class="time">
      //       ${message.created_at}
      //       </div>
      //     </div>
      //   </div>
      // </div>`
      //   return html;
      // } elsif ( userid == current) {
      //   let html = `<div class="message1">
      //   <div class="message1__left">
      //     <div class="time">
      //     ${message.created_at}
      //     </div>
      //   </div>
      //   <div class="message1__right">
      //     <div class="Speech-bubble">
      //       <div class="mycomment">
      //       <p>${message.content}</p>
      //       </div>

      //     </div>
      //   </div>
      // </div>`;
      //   return html;
    } else {
      let html = `<div class="message1">
        <div class="message1__left">
          <div class="time">
          ${message.created_at}
          </div>
        </div>
        <div class="message1__right">
          <div class="Speech-bubble">
            <div class="mycomment">
            <p>${message.content}</p>
            </div>
           
          </div>
        </div>
      </div>`;
      return html;
    }
  }

  $(".Form").on("submit", function (e) {
    console.log("h");
    // preventDefault()を使用してデフォルトのイベントを止める
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr("action");
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false,
    })
      .done(function (data) {
        let html = buildHTML(data);
        $(".chat-room__message-list").append(html);
        $(".chat-room__message-list").animate({
          scrollTop: $(".chat-room__message-list")[0].scrollHeight,
        });
        $(".Form")[0].reset();
        $(".Form__submit").prop("disabled", false);
      })
      .fail(function () {
        console.log("っっs");

        alert("メッセージ送信に失敗しました");
        $(".Form__submit").prop("disabled", false);
      });
  });
});
