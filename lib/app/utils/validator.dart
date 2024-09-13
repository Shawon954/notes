class ErrorMessage{
  String? nameError(String value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

 String? titleError(String value) {
    if (value.isEmpty) {
      return 'Please write title';
    }
    return null;
  }

 String? detailsError(String value) {
    if (value.isEmpty) {
      return 'Please write details';
    }
    return null;
  }


  String? validateEmail(String? value) {

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }



}