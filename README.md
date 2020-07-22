# iOSProjects
This Repo contains my applied projects on LinkedIn Courses.
Some tips:
1- To show keyboard    : myTextField.becomeFirstResponder()
2- To dismiss keyboard : myTextField.resignFirstResponder()
3- To dismiss keyboard and don't know which field : there is a method in viewcontroller called:
touchesBegan : override this method and write : view.endEditing(true)
4- another way to dismiss keyboard, conform UITextFieldDelegate then set the textfield delegate with the view itself that conforms the delegate: myTextField.delegate = self after that implement the (textFieldShouldReturn) method and write : myTextField.resignFirstResponder() then return false, so when you end editing in your textfield and want to dismiss the keyboard just press the return button in the keyboard and it will resign automatically.
