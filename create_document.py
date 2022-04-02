import os
import shutil
import sys
import yaml

basedir = os.getcwd()
sources = basedir + '/src'
arguments = sys.argv[1:]

if len(arguments) < 3:
    semesters = [d for d in os.listdir(sources) if os.path.isdir(d) and (d.startswith('ss') or d.startswith('ws'))]
    semester = input('Select a semester (' + '/'.join(semesters) + '): ')
    courses = [d for d in os.listdir(sources + '/' + semester) if os.path.isdir('src/' + semester + '/' + d)]
    course = input('Select a course (' + '/'.join(courses) + '): ')
else:
    semester = arguments[0]
    course = arguments[1]
    prefix = arguments[2]

os.chdir(sources + '/' + semester + '/' + course)

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