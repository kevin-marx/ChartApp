//
//  ViewController.swift
//  Test App
//
//  Created by Kevin Marx on 7/1/19.
//  Copyright © 2019 Kevin Marx. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var MaxAmt: UISlider!
    @IBOutlet weak var RefreshButton: UIButton!
    
    var valueArr = [Double]()
    
    @IBAction func GraphAnimate(_ sender: UIButton) {
        let plot = getYVals()
        for i in 0...100 {
            
        }
    }
    @IBAction func UpdateChart(_ sender: UISlider) {
        let val = Int(sender.value)
        barMaker(chartBar: barChart, value: val)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        barMaker(chartBar: barChart, value: 0)
        
    }

}

func displayChart(chartBar: BarChartView, dataList: Array<Double>) {
    var plotData = [ChartDataEntry]()
    for (index, value) in dataList.enumerated() {
        let chartEntry = BarChartDataEntry(x: Double(index), y: value)
        plotData.insert(chartEntry, at: 0)
    }
    let dataSet = BarChartDataSet(entries: plotData, label: "haha yes")
    let data = BarChartData(dataSets: [dataSet])
    chartBar.data = data
    chartBar.chartDescription?.text = "random stuff"
    chartBar.leftAxis.axisMaximum = 1
    chartBar.leftAxis.axisMinimum = -1
    
    chartBar.notifyDataSetChanged()
}

func getYVals() -> Array<Double> {
    var values: Array<Double> = []
    let max = 99
    for i in 0...max {
        let TAU = 2 * Double.pi
        let val:Double = sin(Double(i)/Double(max) * TAU)
        values.insert(val, at: 0)
    }
    
    return values
}

func barMaker(chartBar: BarChartView, value: Int) {
    var plotData = [ChartDataEntry]()
    for i in 0...99 {
        plotData.insert(BarChartDataEntry(x: Double(i), y: Double(sin(Double(i)/Double(value) * 2 * Double.pi))), at: 0)
    }
    
    let dataSet = BarChartDataSet(entries: plotData, label: "haha yes")
    let data = BarChartData(dataSets: [dataSet])
    chartBar.data = data
    chartBar.chartDescription?.text = "random stuff"
    chartBar.leftAxis.axisMaximum = 1
    chartBar.leftAxis.axisMinimum = -1
    
    chartBar.notifyDataSetChanged()
}
