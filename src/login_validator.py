"""Login validation logic under test."""
import re

VALID_USERS = {"admin": "Admin@123", "student": "Test@2026"}


def is_valid_email(email):
    return bool(re.fullmatch(r"[\w.+-]+@[\w-]+\.[\w.]+", email or ""))


def is_strong_password(password):
    if not password or len(password) < 8:
        return False
    return (any(c.isupper() for c in password)
            and any(c.isdigit() for c in password)
            and any(not c.isalnum() for c in password))


def login(username, password):
    if not username or not password:
        return "Username and password are required"
    if VALID_USERS.get(username) == password:
        return "Login successful"
    return "Invalid credentials"
