window.draw_graph = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: gon.date,  #日付を配列で
            datasets: [{
                label: '体重',
                data: gon.weight,
                backgroundColor: 'rgba(0,255,240,0.2)',
                borderColor: 'rgba(0,255,240,1)',
                borderWidth: 3,
                pointStyle:'star',
                yAxisID: "y-axis-1",
            },{
                label: '体脂肪率',
                data: gon.fat,
                backgroundColor: 'rgba(0,0,0,0)',
                borderColor: 'rgba(255,99,132,1)',
                borderWidth: 3,
                yAxisID: "y-axis-2",
            }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            yAxes: [{
                id: "y-axis-1",   # Y軸のID
                type: "linear",   # linear固定 
                position: "left", # どちら側に表示される軸か？
                ticks: {          # スケール
                    max: gon.weight_max + 10,
                    min: gon.weight_min - 15,
                    stepSize: 10
                },
            }, {
                id: "y-axis-2",
                type: "linear", 
                position: "right",
                ticks: {
                    max: gon.fat_max + 5,
                    min: gon.fat_min - 5,
                    stepSize: 1
                },
                gridLines: {      # 横グリッドは統一
                  drawOnChartArea: false, 
                },
            }],
          }
        }
    })





#1週間、1ヶ月、3ヶ月、1年間をクリックイベントで表示変更可能にする。
#日付を２つ選んでその差を横軸に表示。