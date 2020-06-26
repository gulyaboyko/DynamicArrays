# DynamicArrays

|  | Создание 1_000_000 элементов  | Вставка в начало  | Вставка в середину | Вставка в конец |  Чтение первого элемента |  Чтение из середины |  Чтение последнего элемента | Удаление 1 элемента | Удаление из середины | Удаление из середины |
| :---: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | 
| SingleArray (на 100_000)  | 3727285 | 134 | 101 | 71 | 0 | 0 | 0 | 146 | 108 | 71 |
| VectorArray  | 42097 | 1393 | 628 | 0 | 0 | 0 | 0 | 812 | 402 | 0 |
| FactorArray  | 1947 | 1069 | 534 | 0 | 0 | 0 | 0 | 738 | 384 | 0 |
| MatrixArray  | 1571 | 1571 | 541 | 0 | 0 | 0 | 0 | 814 | 814 | 0 |
| Array(standart)  | 1113 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

SingleArray
Занимает только столько памяти сколько ему нужно Чтение происходит за O(1) как и у всех остальных массивов, запись и удаление за 0(N)  Запись/удаление в конец значительно быстрее по тому что не нужно перемещать остальные значения на новые места - но копирование всех значений происходит при каждой записи/удалении что влияет на производительность (если все остальные массивы тестировались на 1_000_000 данных, то простой в разумные сроки удалось создать только для 100_000 записи)

VectorArray
Занимает в худшие времена на N (у меня 10_000) памяти больше чем необходимо Перевыделение памяти происходит на каждые N блоков (я тестировала на 10_000) и по этому удаление и вставка новых значений не всегда приводит к перевыделению памяти что ускоряет этот процесс относительно простого массива.  Создание массива из 100_000 происходит значительно быстрее (554 против 3727285 миллисекунд) создания простого массива

FactorArray 
Занимает в худшие времена в 2 раза больше памяти чем необходимо В отличии от VectorArray перевыделение памяти происходит не “на” а “в” раз когда это необходимо, что дает увеличение производительности на больших цифрах (например создание 1_000_000 записей для FactorArray как видно из таблицы происходит за 1947 милисекунд в то время как создание такого же массива VectorArray происходит за 42097 секунд)

MatrixArray Храним данные в двумерном массиве (фиксированной длины каждый массив в массиве) Память выделяем блоками по заданному кол-ву (у меня 10_000), выигрывает только при создании (на 1_000_000 данных создается за 1571 миллисекунд в отличии от FactorArray который создается за 1947 секунд), но вставка/удаление в начало/середину массива немного дольше чем в FactorArray происходит думаю по тому усложнилась логика сдвига всех значений в массиве

ListArray Стандартный динамически массив языка Swift - победитель конкурса динамических массивов =) Не только создание 1млн элементов быстрее всего происходит, но и вставка/удаление в начало/середину массива произошла за 0 мс (вставка в начало за 1 мс, остальное за 0)
