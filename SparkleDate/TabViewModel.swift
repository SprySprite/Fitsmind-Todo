//
//  TabViewModel.swift
//  SparkleDate
//
//  Created by Edward Kwon on 5/16/17.
//  Copyright © 2017 Spry Sprite LLC. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import Action


struct TabViewModel {
  let sceneCoordinator: SceneCoordinatorType
  let taskService: TaskServiceType
  
  init(taskService: TaskServiceType, coordinator: SceneCoordinatorType) {
    self.taskService = taskService
    self.sceneCoordinator = coordinator
  }

  func onUpdateTitle(task: TaskItem) -> Action<String, Void> {
    return Action { newTitle in
      return self.taskService.update(task: task, title: newTitle).map { _ in }
    }
  }
  
  func onDelete(task: TaskItem) -> CocoaAction {
    return CocoaAction {
      return self.taskService.delete(task: task)
    }
  }
  
  func onCreateTask() -> CocoaAction {
    return CocoaAction { _ in
      return self.taskService
        .createTask(title: "")
        .flatMap { task -> Observable<Void> in
          let editViewModel = EditTaskViewModel(task: task,
                                                coordinator: self.sceneCoordinator,
                                                updateAction: self.onUpdateTitle(task: task),
                                                cancelAction: self.onDelete(task: task))
          return self.sceneCoordinator.transition(to: Scene.editTask(editViewModel), type: .modal)
      }
    }
  }
}
