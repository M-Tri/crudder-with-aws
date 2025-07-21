# Notes:

* This project is using a **CRA frontend + Flask backend** architecture.

---
## Shell/environments info:
### General :
- Three types : Login shell (~/.bash_profile), Interactive shell(~/.bashrc), script shell.
- A **child process** is any program or script that your current shell starts/runs. Your shell is the parent process. Example:
  - Running a command like node app.js from terminal. Terminal is parent, and new process 'app.js' is child.
  - Starting a script like ./myscript.sh. Terminal is parent, and new process './myscript.sh' is child.
  - **VAR=value** creates a variable only in the current shell session. Ex: Terminal is parent, and new process 'app.js' is child. VAR is only initialized in terminal.
  - **export VAR=value** is passed along the children processes. Ex: Terminal is parent, and new process 'vim text' is child. VAR is only initialized in both.
- Interactive vs login: Opening new tab is usually login, then, opening a new terminal tab or window (usually non-login, interactive). This is to avoid re-running heavy environment 
setups every time you open a new shell tab.

### Summary by ChatGPT:
#### Three types of shells and environment behavior:

* **Login shell**:

  * Runs when you log in to your system (e.g., SSH session or initial Terminal launch configured as login shell).
  * Reads and executes commands from `~/.bash_profile` (or `~/.profile` if `.bash_profile` is missing).
  * Used to set environment variables and things you want once per login session.
  * Example: When you first open Terminal on macOS configured to launch a login shell, this runs.

* **Interactive shell (non-login)**:

  * Runs when you open a new terminal tab or window, or start a new shell inside an existing shell without the `--login` option.
  * Reads and executes commands from `~/.bashrc`.
  * Used to set aliases, functions, prompts, and interactive shell behavior.
  * Example: Opening a new tab in some terminals or running `bash` inside your current shell launches an interactive non-login shell.

* **Non-interactive shell (script shell)**:

  * Runs shell scripts or commands automatically without user interaction.
  * Does **not** read `~/.bashrc` or `~/.bash_profile` by default unless explicitly sourced.
  * Example: Running a script like `./myscript.sh` or `bash script.sh`.

---

#### Child process and environment variables example:

* A **child process** is any program or script started by your current shell (the parent).

* Example 1:

  * You run `node app.js` in Terminal.
  * Terminal is the parent process, and the `node` process running `app.js` is the child process.

* Example 2:

  * You run `./myscript.sh`.
  * Terminal is parent, and `myscript.sh` runs as a child process.

* Variables without export:

  * `VAR=value` sets a shell variable **only in the current shell session** (parent).
  * It is **not passed** to child processes.
  * Example:

    ```bash
    VAR="hello"
    node -e 'console.log(process.env.VAR)'  # Prints undefined
    ```

* Variables with export:

  * `export VAR=value` sets the variable and **marks it to be inherited by child processes**.
  * Child processes will see this variable in their environment.
  * Example:

    ```bash
    export VAR="hello"
    node -e 'console.log(process.env.VAR)'  # Prints "hello"
    ```

---

#### Interactive vs Login shell nuances:

* Opening a **new terminal tab or window** is usually an **interactive non-login shell** (reading `.bashrc`).
* The **login shell** runs only once at login and reads `.bash_profile`.
* This separation helps **avoid re-running heavy environment setups** (like `PATH` exports) on every new shell tab or window, improving speed.
* Often, `.bash_profile` sources `.bashrc` to combine the two behaviors and keep environment consistent.


---

## Steps:

* I am using **VSCode** instead of creating an environment with Gitpod.
* Create an **AWS USER account**.
* Install **AWS Command Line Interface (CLI)**.
* Install **42Crunch extension**.

---

## Command lines:

* `source ./aws-env.sh`
  Start by running the script in your current shell, sets environment variables for AWS CLI.
---

## Links:
* create-budget from AWS ALI Command Reference:
https://docs.aws.amazon.com/cli/latest/reference/budgets/create-budget.html#examples

---

## FREE AWS Cloud Project Bootcamp

* **Application:** Cruddur
* **Cohort:** 2023-A1

This is the starting codebase that will be used in the FREE AWS Cloud Project Bootcamp 2023.

---

![Cruddur Graphic](_docs/assets/cruddur-banner.jpg)

![Cruddur Screenshot](_docs/assets/cruddur-screenshot.png)

## Acknowledgments

*Credit and thanks to Cloud Instructor Andrew Brown from exampro.*
