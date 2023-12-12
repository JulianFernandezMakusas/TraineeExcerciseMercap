import Call.*

class MonthlyBill {
	
	var monthlySubscription	
	var callsMade = []
	var expenseLocalCalls
	var expensenationalAndInternationalCalls
	
	method do(aCall) {
		callsMade.add(aCall)
	}
	
	method doMonthlyBilling() {
			console.println("Monthly subscription: $" + monthlySubscription)
			expenseLocalCalls = self.calculateExpenseBy(local)
			console.println("Expense on Local calls: $" + expenseLocalCalls)
			expensenationalAndInternationalCalls = self.calculateExpenseBy(nationalAndInternational)
			console.println("Expense on National and International calls: $" + expensenationalAndInternationalCalls)
			console.println("Total expense: $" + (expenseLocalCalls + expensenationalAndInternationalCalls))
			console.println("Subscription left: $" + (monthlySubscription - expenseLocalCalls - expensenationalAndInternationalCalls))
	}
	
	method calculateExpenseBy (type) {
		var calls = self.filterCallBy(type)
		return calls.sum{call => call.cost()}
	}

	method filterCallBy(type) {
		return callsMade.filter{call => call.typeOfCall() == type} 
	}
}