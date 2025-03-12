function validateForm() {
    // Get form values
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirm-password").value;
    const interests = document.querySelectorAll("input[name='interests']:checked");
    const dob = document.getElementById("dob").value;

    // Check if passwords match
    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false;
    }

    // Check if at least one interest is selected
    if (interests.length === 0) {
        alert("Please select at least one interest.");
        return false;
    }

    // Check if DOB is valid (optional)
    const today = new Date();
    const dobDate = new Date(dob);
    if (dobDate >= today) {
        alert("Invalid Date of Birth.");
        return false;
    }

    // If all validations pass
    alert("Registration successful!");
    return true;
}