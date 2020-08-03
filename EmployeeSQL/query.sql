-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select  employees.emp_no as "Employee Number", 
        employees.last_name as "Last name", 
        employees.first_name as "First name", 
        employees.sex as "Sex", 
        salaries.salary as "Salary"
from employees
join salaries on employees.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select  employees.emp_no as "Employee Number", 
        employees.last_name as "Last name", 
        employees.hire_date as "Hire Date" 
from employees 
where employees.hire_date = '%/1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select  dept_manager.dept_no as "Department Number",
        departments.dept_name as "Department Name",
        dept_manager.emp_no as "Manager's Employee Id",
        employees.last_name as "Last Name",
        employees.first_name as "First Name"
from dept_manager
join departments on dept_manager.dept_no = departments.dept_no
join employees on dept_manager.emp_no = employees.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select  employees.emp_no as "Employee Number",
        employees.last_name as "Last Name",
        employees.first_name as "First Name",
        departments.dept_name as "Department Name"
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select  employees.first_name as "First Name",
        employees.last_name as "Last Name",
        employees.sex as "Sex"
from employees
where first_name = "Hercules" and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select  employees.emp_no as "Employee Number",
        employees.last_name as "Last Name",
        employees.first_name as "First Name",
        departments.dept_name as "Department Name"
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select  employees.emp_no as "Employee Number",
        employees.last_name as "Last Name",
        employees.first_name as "First Name",
        departments.dept_name as "Department Name"
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select  last_name as "Last Name",
        count(last_name) as "Count of Last Names"
from employees
group by last_name
ORDER BY COUNT(last_name) DESC;
