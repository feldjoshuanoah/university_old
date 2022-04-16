import os
import shutil
import sys
import yaml

def select_from_options(name, options):
    selection = input('Select a ' + name + ' (' + '/'.join(options) + '): ')
    filtered_options = list(filter(lambda x: x.startswith(selection), options))
    if len(filtered_options) > 1:
        print('There is more than one ' + name + ' starting with "' + selection + '"')
        print('Select a ' + name + ' from the following options: ')
        for index, item in enumerate(filtered_options):
            print(str(index + 1) + ': ' + item)
        return filtered_options[int(input('Enter a number (1-' + str(len(filtered_options)) + '): ')) - 1]
    else:
        return filtered_options[0]

basedir = os.getcwd()
arguments = sys.argv[1:]

os.chdir('src')
if len(arguments) < 3:
    semester = select_from_options('semester', [d for d in os.listdir(os.getcwd()) if os.path.isdir(d) and (d.startswith('ss') or d.startswith('ws'))])
    course = select_from_options('course', [d for d in os.listdir(semester) if os.path.isdir(semester + '/' + d)])
else:
    [semester, course, prefix] = arguments

os.chdir(semester + '/' + course)

with open('course-info.yml') as course_info:
    infos = yaml.full_load(course_info)
    if len(arguments) < 3:
        prefix = select_from_options('prefix', infos['prefixes'])

    index = str(len([f for f in os.listdir(os.getcwd()) if os.path.isfile(f) and f.startswith(prefix) and f.endswith('.tex')]) + 1)

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