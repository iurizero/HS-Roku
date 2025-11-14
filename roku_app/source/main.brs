sub main()
    m.screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    m.screen.setMessagePort(m.port)

    scene = m.screen.CreateScene("HomeScene")
    m.screen.show()

    while true
        msg = wait(0, m.port)
    end while
end sub

