diaA = int(input().split(" ") [1])
horaA, minutoA, segundoA = map(int, input(). split(' : '))

diaB = int(input().split(" ")[1])
horaB, minutoB, segundoB = map(int, input(). split(' : '))

segundos = (segundoB - segundoA) % 60

segundoMaior = segundoA > segundoB
Minutos = (minutoB - minutoA - int(segundoMaior)) % 60

minutoMaior = minutoA > minutoB
horas = (horaB - horaA - (int(segundoMaior))or (int(minutoMaior))) % 24

horamaior = horaA > horaB 
dias = (diaB - diaA - int(segundoMaior))or int(minutoMaior) or int(horamaior)

print(f'{dias} dia(s)')
print(f'{horas} hora(s)')
print(f'{Minutos} minuto(s)')
print(f'{segundos} segundo(s)')
