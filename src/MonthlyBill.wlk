import Call.*

class MonthlyBill {
	
	var monthlySubscription	
	var callsMade = []
	var expenseLocalCalls
	var expensenationalAndInternationalCalls
	var dateOfBilling
	
	method addToRegister(aCall) {
		callsMade.add(aCall)
	}
	
	method doMonthlyBilling() {
			console.println("Monthly subscription: $" + monthlySubscription)
			expenseLocalCalls = self.calculateExpenseBy(local)
			console.println("Expense on Local calls: $" + expenseLocalCalls)
			expensenationalAndInternationalCalls = self.calculateExpenseBy(nationalAndInternational)
			console.println("Expense on National and International calls: $" + expensenationalAndInternationalCalls)
			console.println("Total expense: $" + (expenseLocalCalls + expensenationalAndInternationalCalls))
			console.println("Subscription left: $" + self.remainingSubscription())
	}
	
	method calculateExpenseBy (type) {
		var calls = self.filterCallBy(type)
		return calls.sum{call => call.cost()}
	}

	method filterCallBy(type) {
		return callsMade.filter{call => call.typeOfCall() == type} 
	}
	
	method isDateOfBilling() {
		if(new Date().day() == dateOfBilling) {
			self.doMonthlyBilling()
		} 
	}
	
	method remainingSubscription() {
		return (monthlySubscription - expenseLocalCalls - expensenationalAndInternationalCalls)
	}
}