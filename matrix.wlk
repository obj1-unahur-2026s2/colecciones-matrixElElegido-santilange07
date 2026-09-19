object neo{
    var energia = 100
    method esElElegido()=true
    method saltar(){energia = energia/2}
    method vitalidad()=energia/10
}
object morfeo{
    var estaDescansado = true
    var vitalidad = 8
    method esElElegido()=true
    method saltar(){estaDescansado = !estaDescansado
    vitalidad = (vitalidad-1).max(0)}
    method vitalidad()= vitalidad
}
object trinity{
    method vitalidad() = 0
    method esElElegido()= false
    method saltar(){}
}

object nave{
 const pasajeros = #{neo,morfeo,trinity}
 method agregar(pasajero){pasajeros.add(pasajero)}
 method sacar(pasajero){pasajeros.remove(pasajero)}
 method bajarATodos(){pasajeros.clear()}
 method cauntosPasajerosHay(){pasajeros.size()}
 method pasajeroDeMayorVitalidad() = pasajeros.max({a=>a.vitalidad()})
 method laNaveEstaEquilibrada() = pasajeros.all({a,p=>a.vitalidad()<p.vitalidad()*2})
 method estaElElegido() = pasajeros.any({a=>a.esElElegido()})
 method choca(){pasajeros.forEach({a=>a.saltar()})
 self.bajarATodos()}
 method acelerar(){pasajeros.filter({a=>not a.esElElegido()}).forEach({a=>a.saltar()})}
}