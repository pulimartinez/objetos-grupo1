object springfield{
	var vientos = 10
	var riqueza = 0.9
	var densidadEnergetica = 20
	var listaDeCentrales = [centralAtomicaBurns,centralDeCarbon,centralEolica]
	
	method vientos(){
		return vientos
	}
	
	method riqueza(){
		return riqueza
	}
	 method centralesContaminantes(){
	 	return listaDeCentrales.filter({
	 		central => central.contaminacion()
	 	})
	 }
}

object centralAtomicaBurns{
	var varilla = 0
	method produccionEnergetica () {
		return 0.1 * varilla
		 }
	method varilla(){
		return varilla
	}
	method contaminacion (){
		return self.varilla() == 20 
	}
}

object centralDeCarbon{
	var toneladas = 0
	method produccionEnergetica (){
		return 0.5 + toneladas * springfield.riqueza()
	}
	method contaminacion(){
		return true
	}
}
object turbina1{
	method produccionTurbina(){
	 return 0.2 * springfield.vientos()
	} 
}
object centralEolica {
	var listaTurbinas = [turbina1]

	method produccionEnergetica (){
	return listaTurbinas.sum({turbina => turbina.produccionTurbina()})
	}
	
	method contaminacion(){
		return false
	}
	
}

