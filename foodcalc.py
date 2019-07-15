class pet_food:
	def __init__(self, pet_type,weight):
		self.weight=int(weight)
		self.pet_type=str(pet_type).lower()

	def dog_calculator(self):
		if self.pet_type=='dog':
			print("amount of food in gram for your dog with weight %skg is %1.2f" %(self.weight, 38.94*(self.weight**0.75)))

		else:
			print('incompatible pet')

	def cat_calculator(self):
		if self.pet_type=='cat':
			print("amount of food in gram for your cat with weight %skg is %1.2f" %(self.weight,self.weight*8.6312))

		else:
		  print('incompatible pet')

