/**
 * alert창
 */

 function error() {
                     Swal.fire({
                         icon: 'error',            // Alert 타입
                         title: '에러 발생',         // Alert 제목
                         text: '게시글을 조회하지 못했습니다.',  // Alert 내용
                     });
                 };


 function error(word) {
                     Swal.fire({
                         icon: 'error',                        
                         title: '에러 발생',         
                         text: word, 
                     });
                 };

 function alertMsg(word) {
                     Swal.fire({
                         icon: 'success',                        
                         title: '성공',         
                         text: word, 
                     });
                 };