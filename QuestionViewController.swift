//
//  QuestionViewController.swift
//  Trivia
//
//  Created by WanRong Wu on 6/23/25.
//

import UIKit

struct Question
{
    let prompt: String
    let answers: [String]
}

class QuestionViewController: UIViewController
{
    
    @IBOutlet weak var questionNumLabel: UILabel!
    
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var a1Button: UIButton!
    
    @IBOutlet weak var a2Button: UIButton!
    
    @IBOutlet weak var a3Button: UIButton!
    
    @IBOutlet weak var a4Button: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func didTapA1Button(_ sender: UIButton)
    {
        if currentQuestionNum == 0 || currentQuestionNum == 1
        {
            numCorrect += 1
        }
        
        currentQuestionNum += 1
        
        if currentQuestionNum < 3
        {
            loadQuestion(number: currentQuestionNum)
        }
        if currentQuestionNum == 3
        {
            scoreLabel.text = "Score: " + String(numCorrect) + "/3"
        }
    }
    
    @IBAction func didTapA2Button(_ sender: UIButton)
    {
        currentQuestionNum += 1
        
        if currentQuestionNum < 3
        {
            loadQuestion(number: currentQuestionNum)
        }
        if currentQuestionNum == 3
        {
            scoreLabel.text = "Score: " + String(numCorrect) + "/3"
        }
    }
    
    @IBAction func didTapA3Button(_ sender: UIButton)
    {
        if currentQuestionNum == 2
        {
            numCorrect += 1
        }
        
        currentQuestionNum += 1
        
        if currentQuestionNum < 3
        {
            loadQuestion(number: currentQuestionNum)
        }
        if currentQuestionNum == 3
        {
            scoreLabel.text = "Score: " + String(numCorrect) + "/3"
        }
    }
    
    @IBAction func didTapA4Button(_ sender: UIButton)
    {
        currentQuestionNum += 1
        
        if currentQuestionNum < 3
        {
            loadQuestion(number: currentQuestionNum)
        }
        if currentQuestionNum == 3
        {
            scoreLabel.text = "Score: " + String(numCorrect) + "/3"
        }
    }
    
    var currentQuestionNum = 0
    var numCorrect = 0
    var questionBank = [Question(prompt: "", answers: [""])]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        questionBank = createQuestions()
        
        loadQuestion(number: currentQuestionNum)
        scoreLabel.text = ""
    }
    
    private func loadQuestion(number num: Int)
    {
        questionNumLabel.text = "Question " + String(num + 1)
        questionLabel.text = questionBank[num].prompt
        
        a1Button.setTitle(questionBank[num].answers[0], for: .normal)
        a2Button.setTitle(questionBank[num].answers[1], for: .normal)
        a3Button.setTitle(questionBank[num].answers[2], for: .normal)
        a4Button.setTitle(questionBank[num].answers[3], for: .normal)
    }
    
    private func createQuestions() -> [Question]
    {
        let q1 = Question(prompt: "What year did the first Star Wars movie release?",
                          answers: ["1977", "1979", "1985", "1999"])
        let q2 = Question(prompt: "What is the highest grossing movie of all time?",
                          answers: ["Avatar", "Avengers: Endgame", "Titanic", "Avatar 2"])
        let q3 = Question(prompt: "Which movie is NOT directed by Steven Spielberg?",
                          answers: ["E.T.", "Jaws", "Jurassic Park", "Titanic"])
        
        return [q1, q2, q3]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
