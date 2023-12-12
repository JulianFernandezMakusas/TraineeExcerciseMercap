import Place.*
import Call.*
import MonthlyBill.*

object main {
	
	var dateOfBilling = 12 // Hay que igualarlo al numero de dia del sistema para ejecutar el main y que muestre la factura
	
	method main () {
		// Creamos lugares a donde realizaran las llamadas nacionales e internacionales
		const sanSalvadorDeJujuy = new Place(cost = 0.60)
		const madrid = new Place(cost = 2)
		// Creamos las llamadas a realizar
		const localCallRushHour = new Call(duration = 15, typeOfCall = local, time = 12, place = local)
		const localCallNormalHour = new Call(duration = 40, typeOfCall = local, time = 21, place = local)
		const nationalCall = new Call(duration = 20, typeOfCall = nationalAndInternational, time = 15, place = sanSalvadorDeJujuy)
		const internationalCall = new Call(duration = 10, typeOfCall = nationalAndInternational, time = 9, place = madrid)
		// Creamos la facturacion del usuario con un abono mensual basico
		const bill = new MonthlyBill(monthlySubscription = 50, callsMade = [], expenseLocalCalls = 0, expensenationalAndInternationalCalls = 0)
		// Realizamos las llamadas
		bill.do(localCallRushHour)
		bill.do(localCallNormalHour)
		bill.do(nationalCall)
		bill.do(internationalCall)
		// Realiza la facturacion si es el dia de facturacion
		if (self.isDateOfBilling()) {			
			bill.doMonthlyBilling()
		}
	}
	
	method isDateOfBilling() {
		return new Date().day() == dateOfBilling 
	}
}
