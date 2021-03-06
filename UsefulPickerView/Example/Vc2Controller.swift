//
//  Vc2Controller.swift
//  UsefulPickerVIew
//
//  Created by jasnig on 16/4/24.
//  Copyright © 2016年 ZeroJ. All rights reserved.
// github: https://github.com/jasnig
// 简书: http://www.jianshu.com/users/fb31a3d1ec30/latest_articles

//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

//

import UIKit

class Vc2Controller: UIViewController {

    @IBOutlet weak var singleTextField: SelectionTextField!
    @IBOutlet weak var multipleTextField: SelectionTextField!
    @IBOutlet weak var multipleAssociatedTextField: SelectionTextField!
    @IBOutlet weak var citiesTextField: SelectionTextField!
    @IBOutlet weak var dateTextField: SelectionTextField!
    @IBOutlet weak var timeTextField: SelectionTextField!

    @IBOutlet weak var selectedDataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 代码生成
        let test = SelectionTextField(frame: CGRect(x: 20, y: 340, width: 340, height: 28))
        test.borderStyle = .roundedRect
        test.placeholder = "代码初始化"
        test.showSingleColPicker("测试代码", data: singleData, defaultSelectedIndex: 0, autoSetSelectedText: true) { (textField, selectedIndex, selectedValue) in
            print(selectedValue)
        }
        view.addSubview(test)
        
        singleTextField.showSingleColPicker("编程语言选择", data: singleData, defaultSelectedIndex: 2, autoSetSelectedText: true) {[unowned self] (textField, selectedIndex, selectedValue) in
            //  可以使用textField 也可以使用 self.singleTextField
            textField.text = "选中了第\(selectedIndex)行----选中的数据为\(selectedValue)"
            self.selectedDataLabel.text = "选中了第\(selectedIndex)行----选中的数据为\(selectedValue)"

        }
        
        
        multipleTextField.showMultipleColsPicker("持续时间选择", data: multipleData, defaultSelectedIndexs: [0,1,1], autoSetSelectedText: true) { [unowned self] (textField, selectedIndexs, selectedValues) in
            self.multipleTextField.text = "选中了第\(selectedIndexs)行----选中的数据为\(selectedValues)"
            
        }
        
        
        // 注意这里设置的是默认的选中值, 而不是选中的下标
        multipleAssociatedTextField.showMultipleAssociatedColsPicker("多列关联数据", data: multipleAssociatedData, defaultSelectedValues: ["交通工具","陆地","自行车"], autoSetSelectedText: true) {[unowned self] (textField, selectedIndexs, selectedValues) in
            self.multipleAssociatedTextField.text = "选中了第\(selectedIndexs)行----选中的数据为\(selectedValues)"
            self.selectedDataLabel.text = "选中了第\(selectedIndexs)行----选中的数据为\(selectedValues)"

        }
        
        // 注意设置默认值得时候, 必须设置完整, 不能进行省略 ["四川", "成都", "成华区"] 比如不能设置为["四川", "成都"]
        // ["北京", "通州"] 不能设置为["北京"]
        citiesTextField.showCitiesPicker("省市区选择", defaultSelectedValues: ["四川", "成都", "郫县"], autoSetSelectedText: false) {[unowned self] (textField, selectedIndexs, selectedValues) in
            self.citiesTextField.text = "选中了第\(selectedIndexs)行----选中的数据为\(selectedValues)"
            self.selectedDataLabel.text = "选中了第\(selectedIndexs)行----选中的数据为\(selectedValues)"

        }
        
        dateTextField.showDatePicker("日期选择", autoSetSelectedText: true) { (textField, selectedDate) in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let string = formatter.string(from: selectedDate)
            textField.text = string
        }
        ///          ///  @author ZeroJ, 16-04-25 17:04:28
        // style里面可以更改的和系统的DatePicker属性是一一对应的
        var dateStyle = DatePickerSetting()
        dateStyle.dateMode = .date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: "2000-01-11")
        dateStyle.date = date!
        ///          ///  @author ZeroJ, 16-04-25 17:04:28
        /// 注意使用这种方式的时候, 请设置 autoSetSelectedText = false, 否则显示的格式可能不是您需要的
        timeTextField.showDatePicker("时间选择", datePickerSetting: dateStyle, autoSetSelectedText: false) { (textField, selectedDate) in
            let formatter = DateFormatter()
            // H -> 24小时制
            formatter.dateFormat = "yyyy-MM-dd"
            let string = formatter.string(from: selectedDate)
            textField.text = string
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
