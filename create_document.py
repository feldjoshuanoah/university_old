import os
import shutil
import sys
import yaml

basedir = os.getcwd()
arguments = sys.argv[1:]

os.chdir('src')
if len(arguments) < 3:
    semesters = [d for d in os.listdir(os.getcwd()) if os.path.isdir(d) and (d.startswith('ss') or d.startswith('ws'))]
    semester = input('Select a semester (' + '/'.join(semesters) + '): ')
    courses = [d for d in os.listdir(semester) if os.path.isdir(semester + '/' + d)]
    course = input('Select a course (' + '/'.join(courses) + '): ')
else:
    [semester, course, prefix] = arguments

os.chdir(semester + '/' + course)

with open('course-info.yml') as course_info:
    infos = yaml.full_load(course_info)
    if len(arguments) < 3:
        prefix = input('Select a prefix (' + '/'.join(infos['prefixes']) + '): ')

    index = str(len([f for f in os.listdir(os.getcwd()) if os.path.isfile(f) and f.startswith(prefix)]) + 1)

    file_name = prefix + '-' + index.zfill(2) + '.tex'
    shutil.copyfile(basedir + '/template.tex', file_name)
    with open(file_name, 'r') as file_read:
        content = file_read.read()
        year = '20' + semester[-2:] + ('/' + str(int(semester[-2:]) + 1) if semester.startswith('ws') else '')
        replacements = {
            '$1$': infos[prefix][0],
            '$2$': infos['institute'],
            '$3$': infos[prefix][1] + ' ' + index,
            '$4$': infos['name'],
            '$5$': infos['professor'],
            '$6$': ('Sommer' if semester.startswith('ss') else 'Winter') + 'semester ' + year
        }
        for placeholder in replacements:
            content = content.replace(placeholder, replacements[placeholder])
        with open(file_name, 'w') as file_write:
            file_write.truncate(0)
            file_write.writelines(content)