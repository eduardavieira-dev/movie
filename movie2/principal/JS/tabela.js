document.addEventListener("DOMContentLoaded", tabela);
// window.addEventListener("load", tabela);
function tabela(filtro = '') {
    $(document).ready(function () {
        $.ajax({
            type: 'POST',
            url: '../PHP/tabela.php',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            dataType: 'json',
            success: function (data) {
                console.log('deu certo');
                data == false ? naoexibir() : exibir(data, filtro);
            }

        });
    });
}

function naoexibir() {

    t = $('#filmes');

    var nome = $('<h3>').addClass('produto-nome').text('Nenhum filme encontrado');

    t.append(nome);

}

function exibir(data, filtro) {

    filmes = data;

    t = $('#filmes');


    // if (filtro) {
    //     filmes = filmes.filter(filme => {
    //         return filme.nome.toLowerCase().includes(filtro.toLowerCase());
    //     });
    // }

    filmes.forEach(function (filme) {
        var item = $('<div>').addClass('filme');

        var nome = $('<h3>').addClass('filme-nome').text(filme.nome);
        item.append(nome);

        var imgContainer = $('<div>').addClass('img-container');
        var imagem = $('<img>').attr('src', filme.imagem);
        imgContainer.append(imagem);
        item.append(imgContainer);

        var divAssitir = $('<div>').addClass('confirmacao-container');
        var botaoAssistir = $('<button>').addClass('confirmar-btn').attr('type', 'button').text('assistir').data('id', filme.cod);
        divAssitir.append(botaoAssistir);
        item.append(divAssitir);

        t.append(item);
    });
}