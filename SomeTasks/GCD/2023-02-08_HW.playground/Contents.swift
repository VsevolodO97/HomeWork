import UIKit

/*
 - реализовать параллельную загрузку и одновременное отображение 10 аватаров пользователя. Для синхронизации использовать любой инструмент GCD

 */


// Создаем очередь
let queue1 = DispatchQueue(label: "ru.alexkurbatov.serial-queue", attributes: .concurrent)
let queue2 = DispatchQueue(label: "ru.alexkurbatov.serial-queue1", attributes: .concurrent)

// Создаем группу загрузки
let downloadingGroup = DispatchGroup()
// Создаем группу отображения
let showingGroup = DispatchGroup()


var arrayOfDownloadedAvatars: [Int] = [] // Сделать потокобезопасным: сделать сущность reference type со свойцством масиив и методом добавления элементов. Метод сделать потокобезопасным.

for i in 0...10 {
    
    let workItem = DispatchWorkItem {
        print("workItem: Avatar \(i) is downloading")
        sleep(3)
        arrayOfDownloadedAvatars.append(i)
        print("workItem: Avatar \(i) has been downloaded")
    }
    queue1.async(group: downloadingGroup, execute: workItem)
}


// Устанавливаем уведомление. Замыкание будет выполнено на главной очереди сразу после того, как все задачи в группе будут выполнены.
downloadingGroup.notify(queue: DispatchQueue.main) {
   print("All avatars has been downloaded.")
    print(arrayOfDownloadedAvatars.sorted())
}


// - что нужно дописать в коде, чтобы результат всегда был гарантировано 20 000

func testRaceCondition() {

    var count = 0
    let group = DispatchGroup()

    group.enter()
    let thread1 = Thread {
        for _ in 0...9999 {
            count += 1
        }
        group.leave()
    }

    group.enter()
    let thread2 = Thread {
        for _ in 0...9999 {
            count += 1
        }
        group.leave()
    }

    thread1.start()
    thread2.start()

    group.notify(queue: DispatchQueue.global()) {
        print(count)
    }
}

testRaceCondition()













