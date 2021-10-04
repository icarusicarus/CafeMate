const db = require('@models');

exports.login = async (req, res) => {
    const { userNumber, kind, name, email } = req.body;

    await db.user.findOne({
        raw: true,
        where: { userNumber: userNumber }
    })
    .then(async (q) => {
        if(q) {
            const id = q.id;

            await db.gifticon.findOne({
                raw: true,
                where: { user_id: id }
            })
            .then((q) => {
                res.status(200).json({ msg: 'exist', data: q });
            })
            .catch(() => {
                res.status(400).json({ msg: 'error' });
            })
        } else {
            await db.user.create({
                userNumber: userNumber,
                kind: kind,
                name: name,
                email: email,
                created_at: new Date().toString(),
            })
            .then(async (q) => {
                const id = q.get().id;

                await db.gifticon.create({
                    user_id: id,
                    g_4000: 0,
                    g_6000: 0,
                    g_8000: 0,
                    g_10000: 0,
                    updated_at: new Date().toString()
                })
                .then(() => {
                    res.status(200).json({ msg: 'welcome', data: id });
                })
                .catch(() => {
                    res.status(400).json({ msg: 'error' });
                })
            })
            .catch(() => {
                res.status(400).json({ msg: 'error' });
            })
        }
    })
    .catch((e) => {
        console.log(e);
        res.status(400).json({ msg: 'error' });
    })
}

exports.email = (req, res) => {
    const { email } = req.body;

    await db.user.findOne({
        raw: true,
        where: { email: email }
    })
    .then((q) => {
        if(q) {
            res.status(200).json({ msg: 'success' });
        }

        else {
            res.status(400).json({ msg: 'don\'t exist' });
        }
    })
    .catch(() => {
        res.status(400).json({ msg: 'error' });
    })
}