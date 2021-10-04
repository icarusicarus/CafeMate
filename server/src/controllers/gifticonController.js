const db = require('@models');

exports.update = async (req, res) => {
    const { userNumber, gifticonKind, gifticonCount } = req.body;

    await db.user.findOne({
        raw: true,
        where: { userNumber }
    })
    .then(async (q) => {
        const id = q.id;

        await db.gifticon.findOne({
            raw: true,
            where: { user_id: id }
        })
        .then(async (q) => {
            const gifticonCountCheck = q[gifticonKind];

            if(gifticonCountCheck == gifticonCount[gifticonKind]) {
                switch(gifticonKind) {
                    case 'g_4000':
                        await db.gifticon.update({
                            g_4000: gifticonCount[gifticonKind] + 1,     
                        }, {where: { user_id: id }})
                        .then(() => {
                            res.status(200).json({ msg: 'success' });
                        })
                        .catch((e) => {
                            console.log(e);
                            res.status(400).json({ msg: 'error' });
                        })
                        break
                    case 'g_6000':
                        await db.gifticon.update({
                            g_6000: gifticonCount[gifticonKind] + 1,     
                        }, {where: { user_id: id }})
                        .then(() => {
                            res.status(200).json({ msg: 'success' });
                        })
                        .catch((e) => {
                            console.log(e);
                            res.status(400).json({ msg: 'error' });
                        })
                        break
                    case 'g_8000':
                        await db.gifticon.update({
                            g_8000: gifticonCount[gifticonKind] + 1,     
                        }, {where: { user_id: id }})
                        .then(() => {
                            res.status(200).json({ msg: 'success' });
                        })
                        .catch((e) => {
                            console.log(e);
                            res.status(400).json({ msg: 'error' });
                        })
                        break
                    case 'g_10000':
                        await db.gifticon.update({
                            g_10000: gifticonCount[gifticonKind] + 1,     
                        }, {where: { user_id: id }})
                        .then(() => {
                            res.status(200).json({ msg: 'success' });
                        })
                        .catch((e) => {
                            console.log(e);
                            res.status(400).json({ msg: 'error' });
                        })
                        break
                }
            }

            else {
                res.status(400).json({ msg: 'don\'t match' });
            }
        })
        .catch((e) => {
            console.log(e);
            res.status(400).json({ msg: 'error' });
        })
    })
    .catch((e) => {
        console.log(e);
        res.status(400).json({ msg: 'error' });
    })

}