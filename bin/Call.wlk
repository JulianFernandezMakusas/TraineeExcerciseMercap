class Call {
	
	var duration 
	var typeOfCall
	var time // En wollok no se puede obtener la hora mediante Date(), por lo que decidi agregarlo como una variable
	var place
	
	method typeOfCall() {
		return typeOfCall
	}
	
	method cost () {
		return typeOfCall.calculateCostOfTheCall(duration, time, place)
	}
}

object local {

	method calculateCostOfTheCall(duration, time, place) {
		if (self.dayOfWeek() and self.itsOnRush(time)) {
			return duration * 0.20
		} else {
			return duration * 0.10
		}
	}

	method itsOnRush (time) {
		return time.between(8, 20)
	}
	
	method dayOfWeek() {
		return new Date().internalDayOfWeek().between(1,5)	
	}
}

// El comportamiento del nacional e internacional no varia, por lo que le asigne la responsabilidad al mismo objeto
object nationalAndInternational {
	
	method calculateCostOfTheCall(duration, time, place) {
		return duration * place.cost()
	}


}