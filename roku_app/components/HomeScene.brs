sub init()
    m.lista = m.top.findNode("lista")

    ' Observa seleção de itens na RowList
    m.lista.observeField("itemSelected", "onSelectItem")

    carregarVideos()
end sub


' --------------------------------------------------------
' Carrega lista de vídeos do servidor local
' --------------------------------------------------------
sub carregarVideos()
    url = "http://SEU_IP_DO_SERVIDOR:8000/videos"

    request = CreateObject("roUrlTransfer")
    request.setUrl(url)

    jsonString = request.GetToString()

    if jsonString = invalid or jsonString = ""
        print "Erro ao obter lista de vídeos."
        return
    end if

    json = ParseJson(jsonString)
    conteudos = []

    for cada in json
        conteudos.push({
            Title: cada.name
            ShortDescriptionLine1: cada.name
            Url: "http://SEU_IP_DO_SERVIDOR:8000" + cada.url
        })
    end for

    m.lista.content = conteudos
end sub


' --------------------------------------------------------
' Chamado quando o usuário seleciona um item na lista
' --------------------------------------------------------
sub onSelectItem()
    index = m.lista.itemSelected
    if index < 0 then return

    item = m.lista.content[index]

    print "Reproduzindo: "; item.Url

    playVideo(item.Url)
end sub


' --------------------------------------------------------
' Toca o vídeo usando o player nativo da Roku
' --------------------------------------------------------
sub playVideo(url as String)
    video = CreateObject("roSGNode", "Video")

    video.content = {
        stream: {
            url: url
            streamFormat: "mp4"
        }
        title: "Playing Video"
    }

    m.top.appendChild(video)
    video.control = "play"
end sub

