extends Node

enum Answers {
	FIRST_NAME,
	LAST_NAME,
	PHONE_NUMBER,
	SSN,
	GENDER_MALE,
	GENDER_FEMALE,
	OVER_18,
	US_CITIZEN,
	SERVED_ARMY,
	FELONY,
	GPA,
}
var answers := {}
var answer_names := {
	Answers.FIRST_NAME: "First Name",
	Answers.LAST_NAME: "Last Name",
	Answers.PHONE_NUMBER: "Phone Number",
	Answers.SSN: "SSN",
	Answers.GENDER_MALE: "Gender (Male)",
	Answers.GENDER_FEMALE: "Gender (Female)",
	Answers.OVER_18: "Over 18",
	Answers.US_CITIZEN: "US Citizen",
	Answers.SERVED_ARMY: "Served Army",
	Answers.FELONY: "Felony",
	Answers.GPA: "GPA",
}
func _ready() -> void:
	for key in answer_names.keys():
		var _name = answer_names.get(key)
		register_answer(key, Answer.new(null))

func register_answer(id:Answers, answer:Answer) -> void:
	answers.set(id, answer)

func get_unfulfilled_questions() -> Array[Answers]:
	var out :Array[Answers] = []
	for id in Answers:
		if answers.get(id) == null: 
			out.append(id)
			continue
		var answer = answers.get(id) as Answer
		if answer == null: 
			out.append(id)
			continue
		elif answer.value == null:
			out.append(id)
			continue
	return out
