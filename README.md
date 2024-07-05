# User Management Script Documentation

Welcome to the User Management Script documentation! This guide will walk you through an efficient and automated way to handle user account creation, group assignments, secure password generation, and logging. This script is an essential tool for SysOps engineers looking to streamline their user management tasks, especially in environments with a large number of users.

## Why Use This Script?

Managing user accounts manually can be time-consuming and error-prone. This script automates the process, ensuring consistency, security, and efficiency. Imagine the ease of onboarding new team members with just a single command!

## Prerequisites

- **Root Privileges**: Ensure you have root access to execute the script.
- **Input File**: Prepare a text file containing usernames and group names in the format `username;groups`. Each line should represent a user and their associated groups.

### Input File Example

Here’s a sample input file `user_data.txt`:

```
light;sudo,dev,www-data
idimma;sudo
mayowa;dev,www-data
```

## What Does the Script Do?

1. **Root Privileges Check**: Verifies that the script is run as root to ensure it has the necessary permissions.
2. **Log File and Secure Password File Creation**: Sets up log and password files with appropriate permissions to track actions and store passwords securely.
3. **Input File Reading**: Reads usernames and group names from a provided text file.
4. **User and Group Creation**: Creates user accounts and assigns them to the specified groups.
5. **Password Generation**: Generates secure, random passwords for each user.
6. **Logging**: Logs all actions performed by the script for audit and review purposes.

## How to Use the Script

### 1. Save the Script

First, save the script content to a file named `create_users.sh`.

### 2. Make the Script Executable

Make the script executable with the following command:

```bash
chmod +x create_users.sh
```

### 3. Prepare the Input File

Create a text file named `user_data.txt` with the desired usernames and groups. Here’s an example:

```
light;sudo,dev,www-data
idimma;sudo
mayowa;dev,www-data
```

### 4. Execute the Script

Run the script by providing the input file as an argument:

```bash
sudo ./create_users.sh user_data.txt
```

### What to Expect

After running the script, you can expect the following:

- **Log File**: All actions performed by the script are logged in `/var/log/user_management.log`.

  Example log entries:

  ```
  User light created successfully.
  Group sudo created.
  User light added to group sudo.
  Group dev created.
  User light added to group dev.
  Group www-data created.
  User light added to group www-data.
  Password for user light set and stored securely.
  User idimma created successfully.
  User idimma added to group sudo.
  Password for user idimma set and stored securely.
  User mayowgta created successfully.
  User mayowa added to group dev.
  User mayowa added to group www-data.
  Password for user mayowa set and stored securely.
  ```

- **Password File**: A secure file `/var/secure/user_passwords.txt` contains the usernames and their generated passwords.

  Example password entries:

  ```
  light,s3cureP@ssw0rd1
  idimma,s3cureP@ssw0rd2
  mayowa,s3cureP@ssw0rd3
  ```

## Conclusion

This user management script simplifies and secures the process of creating user accounts and managing group memberships. By automating these tasks, you save time and reduce the risk of errors, making your SysOps workflow more efficient and reliable.

For further details on enhancing your SysOps skills, visit the [HNG Internship website](https://hng.tech/internship) and explore opportunities to [hire top tech talent](https://hng.tech/hire).

### Additional Resources

- [HNG Internship Program](https://hng.tech/internship)
- [HNG Hire Talent](https://hng.tech/hire)

By implementing this script, you can streamline your user management process, enhance security, and ensure consistent account setup, providing a robust foundation for your organization's IT infrastructure.
