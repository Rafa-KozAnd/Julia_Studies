using Dates, TimerOutputs

struct Event
    name::String
    time::DateTime
    message::String
end

function schedule_alarm(events::Vector{Event})
    while true
        now = Dates.now()
        for event in events
            if Dates.format(now, "HH:MM") == Dates.format(event.time, "HH:MM")
                println("\n⏰ Alarme! ${event.name} - ${event.message}")
                println("Hora: $(event.time)")
                # Opcional: emitir um som no sistema
                # run(`play beep.mp3`)  # Necessário instalar um player de áudio
            end
        end
        sleep(30)  # Verifica a cada 30 segundos
    end
end

function main()
    events = Event[]
    
    println("📅 Assistente de Organização de Horários")
    println("Digite os compromissos (nome, hora no formato HH:MM, mensagem)")

    while true
        print("\nNome do evento (ou 'start' para iniciar alarmes): ")
        name = readline()
        if name == "start"
            break
        end

        print("Horário (HH:MM): ")
        time_str = readline()
        time = DateTime(Dates.today(), time_str * ":00")

        print("Mensagem do alarme: ")
        message = readline()

        push!(events, Event(name, time, message))
    end

    println("\n⏳ Iniciando os alarmes...")
    schedule_alarm(events)
end

main()
