const express = require('express')
const app = express.Router()
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()
const jwt = require('jsonwebtoken')
const dotenv = require('dotenv')
const fileUpload = require('express-fileupload')
const exceljs = require('exceljs')
const fs = require('fs');

dotenv.config()

app.use(fileUpload())

app.post('/create', async (req, res) => {
    try {
        await prisma.product.create({
            data: req.body
        })

        res.send({ message: 'success' })
    } catch (e) {
        res.status(500).send({ message: e.message })
    }
})

app.get('/list', async (req, res) => {
    try {
        const data = await prisma.product.findMany({
            orderBy: {
                id: 'desc'
            },
            where: {
                status: 'use'
            }
        })

        res.send({ results: data })
    } catch (e) {
        res.status(500).send({ message: e.message })
    }
})

app.delete('/remove/:id', async (req, res) => {
    try {
        await prisma.product.update({
            data: {
                status: 'delete'
            },
            where: {
                id: parseInt(req.params.id)
            }
        })

        res.send({ message: 'success' })
    } catch (e) {
        res.status(500).send({ message: e.message })
    }
})

app.put('/update', async (req, res) => {
    try {
        const fs = require('fs')
        const oldData = await prisma.product.findFirst({
            where: {
                id: parseInt(req.body.id)
            }
        })

        // remove old image
        const imagePath = './uploads/' + oldData.img

        if (oldData.img != '') {
            if (fs.existsSync(imagePath)) {
                await fs.unlinkSync(imagePath)
            }
        }


        await prisma.product.update({
            data: req.body,
            where: {
                id: parseInt(req.body.id)
            }
        })
        res.send({ message: 'success' })
    } catch (e) {
        res.status(500).send({ message: e.message })
    }
})

app.post('/upload', async (req, res) => {
    try {
        if (req.files != undefined) {
            if (req.files.img != undefined) {
                const img = req.files.img
                const fs = require('fs')
                const myDate = new Date()
                const y = myDate.getFullYear()
                const m = myDate.getMonth() + 1
                const d = myDate.getDate()
                const h = myDate.getHours()
                const mi = myDate.getMinutes()
                const s = myDate.getSeconds()
                const ms = myDate.getMilliseconds()

                //
                const arrFileName = img.name.split('.')
                const ext = arrFileName[arrFileName.length - 1]

                const newName = `${y}${m}${d}${h}${mi}${s}${ms}.${ext}`

                img.mv('./uploads/' + newName, (err) => {
                    if (err) throw err
                    res.send({ newName: newName })
                })
            }

        } else {
            res.status(501).send('notimplemented')
        }

    } catch (e) {
        res.status(500).send({ error: e.message })
    }
})

app.post('/uploadFromExcel', (req, res) => {
    try {

        if (fileExcel != undefined) {
            if (fileExcel != null) {

                const fileExcel = req.files.fileExcel
                fileExcel.mv('./uploads/' + fileExcel.name, async (error) => {
                    if (error) throw error;

                    // read from file and insert to database
                    const workbook = new exceljs.Workbook()
                    await workbook.xlsx.readFile('./uploads/' + fileExcel.name)

                    const ws = workbook.getWorksheet(1)
                    for (let i = 2; i <= ws.rowCount; i++) {
                        const name = ws.getRow(i).getCell(1).value ?? "" // if null or undefined return ""
                        const cost = ws.getRow(i).getCell(2).value ?? 0 // if null or undefined return 0
                        const price = ws.getRow(i).getCell(3).value


                        if (name != '' && cost >= 0 && price >= 0) { // ถ้า row ใน excel มีค่าว่างมาทั้งหมดจะไม่ยอมให้ upload
                            await prisma.product.create({
                                data: {
                                    name: name,
                                    cost: cost,
                                    price: price,
                                    img: ''
                                }
                            })
                        }
                    }


                    // ลบไฟล์ Excel ทิ้งหลังจากที่เพิ่มข้อมูลใน Database เรียบร้อย
                    fs.unlinkSync('./uploads/' + fileExcel.name)

                    res.send({ message: 'success' })
                })

            } else {
                res.status(500).send({ message: 'fileExcel is null' })
            }
        } else {
            res.status(500).send({ message: 'fileExcel is undefined' })
        }
    } catch (e) {
        res.status(500).send({ error: e.message })
    }
})

module.exports = app