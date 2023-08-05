CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_emp_title
        FOREIGN KEY (emp_title_id)
        REFERENCES titles (title_id)
);
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    CONSTRAINT fk_salaries_emp
        FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(5) NOT NULL,
    CONSTRAINT pk_dept_emp
        PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT fk_dept_emp_emp
        FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no),
    CONSTRAINT fk_dept_emp_dept
        FOREIGN KEY (dept_no)
        REFERENCES departments (dept_no)
);
CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT pk_dept_manager
        PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT fk_dept_manager_dept
        FOREIGN KEY (dept_no)
        REFERENCES departments (dept_no),
    CONSTRAINT fk_dept_manager_emp
        FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);