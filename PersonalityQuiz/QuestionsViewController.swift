//
//  QuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Paul Jacks on 3/5/18.
//  Copyright © 2018 John Hersey High School. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var answerChosen: [Answer] = []

    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var SingleViewButtonOne: UIButton!
    @IBOutlet weak var SingleViewButtonTwo: UIButton!
    @IBOutlet weak var SingleViewButtonThree: UIButton!
    @IBOutlet weak var SingleViewButtonFour: UIButton!
    
    @IBOutlet weak var MultipleStackViewLabelOne: UILabel!
    @IBOutlet weak var MultipleStackViewSwitchOne: UISwitch!
    @IBOutlet weak var MultipleStackViewLabelTwo: UILabel!
    @IBOutlet weak var MultipleStackViewSwitchTwo: UISwitch!
    @IBOutlet weak var MultipleStackViewLabelThree: UILabel!
    @IBOutlet weak var MultipleStackViewSwitchThree: UISwitch!
    @IBOutlet weak var MultipleStackViewLabelFour: UILabel!
    @IBOutlet weak var MultipleStackViewSwitchFour: UISwitch!
    
    
    @IBOutlet weak var rangeSliderLabel1: UILabel!
    @IBOutlet weak var rangeSliderLabel2: UILabel!
    @IBOutlet weak var rangeSlider: UISlider!
    
     
    
    
    
    
    
    
    
    var questionIndex = 0
    var questions: [Question] = [
        Question(text: "Which Food do you like the most?", type: .single, answers:
        [
            Answer(text: "sweets", type: .dog),
            Answer(text: "Exoctic Meats", type: .snake),
            Answer(text: "Meat", type: .tiger),
            Answer(text: "Food is Food", type: .cow),
        ]),
      
        Question(text: "Which activities do you enoy?",
                 type: .multiple,
                 answers: [
            Answer(text: "chilling", type: .cow),
            Answer(text: "do things you shouldnt", type: .snake),
            Answer(text: "play around", type: .dog),
            Answer(text: "anything physical", type: .tiger)
            
            ]),
        Question(text: "How much do you enjoy car rides?", type: .ranged, answers: [
            Answer(text: "I hate them", type: .snake),
            Answer(text: "I barley notice them", type: .tiger),
            Answer(text: "Dont care", type: .cow),
            Answer(text: "I Love them", type: .dog)
            
            
            
            ]),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        
       
        }
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
        
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count{
            updateUI()
        }else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    
    
    
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        SingleViewButtonOne.setTitle(answers[0].text, for: .normal)
        SingleViewButtonTwo.setTitle(answers[1].text, for: .normal)
        SingleViewButtonThree.setTitle(answers[2].text, for: .normal)
        SingleViewButtonFour.setTitle(answers[3].text, for: .normal)
        
    }

    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        MultipleStackViewSwitchOne.isOn = false
        MultipleStackViewSwitchTwo.isOn = false
        MultipleStackViewSwitchThree.isOn = false
        MultipleStackViewSwitchFour.isOn = false
        
        MultipleStackViewLabelOne.text = answers[0].text
        MultipleStackViewLabelTwo.text = answers[1].text
        MultipleStackViewLabelThree.text = answers[2].text
        MultipleStackViewLabelFour.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]){
        rangeStackView.isHidden = false
        rangeSliderLabel1.text = answers.last?.text
        rangeSliderLabel2.text = answers.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case SingleViewButtonOne:
            answerChosen.append(currentAnswers[0])
       
        case SingleViewButtonTwo:
            answerChosen.append(currentAnswers[1])
        
        case SingleViewButtonThree:
            answerChosen.append(currentAnswers[2])
            
        case SingleViewButtonFour:
            answerChosen.append(currentAnswers[3])
        
        default:
            break
        }
    
    nextQuestion()
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
