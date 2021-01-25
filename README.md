# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# LWOT2 (I leave work on time2)
「看護師」の「業務効率を上げる」ためのアプリです。

# Description
私は看護師をしています。
看護師は「白衣の天使」などと言われていますが、日々の患者さんのニーズに応えながら、医療過誤をしないというプレッシャーに耐えるのは心身ともに負担です。
そんな業務にあたる中、残業はしたくないのが本音ですが、患者さんの急変や急な入院等で定時で帰るのは難しい現状があると感じています。
看護師の仕事の中に通称「部屋周り」という、患者さんの検温や様子を伺う業務があります。その業務が滞りなく終わると、その日の計画が立てやすくなり、
仕事も円滑に進むことが多いかと思います。
部屋周りの前に担当患者さんが自分と何を相談したいか把握できることで、看護師は時間配分をしやすくなり、定時に帰ることができる。患者さんも看護師と相談したいことを
事前に伝えておくことが出来て、聞き漏らすことがない。
お互いハッピーになれるかと思います。
アプリ名は「私定時で帰ります」と少し患者さんへの配慮にはかけますが、頑張る白衣の天使を助けたかったので作りました。
また、アプリ名が２になっているのは、技術力不足からデーターベースエラーが解けず、再度作り直しとなってしまった背景からでした。
駆け出しですが、看護師×エンジニアとして、医療に貢献できたら光栄です。



# テーブル設計


## nurse テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| employee_number | string | null: false |
| password        | string | null: false |
| image           |        | null: false |

### Association

- has_one: patient_list
- has_many: patients

## patients テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| doctor      | string | null: false |
| room_number | string | null: false |
| password    | string | null: false |

### Association

- belongs_to: nurse
- belongs_to: patient_list
- belongs_to: question

## patient_lists テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nurse_id   | references | null: false, foreign_key: true |
| patient_id | references | null: false, foreign_key: true |

### Association

- has_one: nurse
- has_many: patient
- has_many: question

## questions　テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nurse_id   | references | null: false, foreign_key: true |
| patient_id | references | null: false, foreign_key: true |

### Association

- has_one: patient
- belongs_to: patient_list
- has_one: symptoms
- has_one: medical_treatment
- has_one: checkup

## symptoms　テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| oneset_time  | date       | null: false                    |
| body_region  | string     | null: false                    |
| condition    | string     | null: false                    |
| question_id  | references | null: false, foreign_key: true |

### Association

- has_one: question

## medical_treatments　テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| consultation_content | integer    | null: false                    |
| detail               | text       | null: false                    |
| question_id          | references | null: false, foreign_key: true |

### Association

- has_one: question

## checkups　テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| consultation_content | integer    | null: false                    |
| detail               | text       | null: false                    |
| question_id          | references | null: false, foreign_key: true |

### Association

- has_one: question