var count = 0;
window.onload = (e) => {
    M.AutoInit();
    M.Modal.init(document.querySelectorAll('.modal'), {});
    M.Sidenav.init(document.querySelectorAll('.sidenav'), {});
    createDynamicElement('teamList');
    createDynamicElement('questionList');
    createDynamicElement('answerList'+(++count),'$$');
}
