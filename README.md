# Здесь собраны плейбуки для запуска Ansible

Группы хостов перечислены в inventory-файле.

**Запуск плейбука производить:**

- ansible-playbook playbooks/playbook.yml -l group

## Подключение mitogen

1. Установить mitogen через pip
1. Создать симлинк: ```ln -fs `dirname $(python -c "import ansible_mitogen; print(ansible_mitogen.__file__)")` -t plugins```
1. Подключить к плейбуку одним из вариантов:
    1. `strategy: mitogen_linear`
    1. `export ANSIBLE_STRATEGY=mitogen_linear`
